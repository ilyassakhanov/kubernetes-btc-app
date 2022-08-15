from flask import Flask, json
import requests
import json
import urllib3
import datetime


def get_btc_price():
    # Fetching BTC data from coindesk
    btc_data = requests.get('https://api.coindesk.com/v1/bpi/currentprice.json')
    # Parses json response
    processed_btc_data = btc_data.json()
    return processed_btc_data


def get_exchange_rate():
    # Creating a connector to fetch exchange rate
    http = urllib3.PoolManager()
    # Fetching exchange rate data from Yahoo Finance
    conversion_data = http.request('GET','https://query1.finance.yahoo.com/v7/finance/quote?symbols=EURCZK=X' )
    processed_conversion_data = json.loads(conversion_data.data.decode("utf-8"))
    # Getting exchange rate at CCY exchange last closure
    conversion_rate = processed_conversion_data['quoteResponse']['result'][0]['regularMarketPreviousClose']
    return conversion_rate

def main():
    processed_btc_data = get_btc_price()
    conversion_rate = get_exchange_rate()
    # Constructing response object
    final_data = {
        'update_time_ISO' : processed_btc_data['time']['updatedISO'],
        'clinet_time_ISO' : datetime.datetime.utcnow().strftime("%Y-%m-%dT%H:%M:%S+00:00"),
        'BTC/EUR' : processed_btc_data['bpi']['EUR']['rate_float'],
        'BTC/CZK': processed_btc_data['bpi']['EUR']['rate_float'] * conversion_rate  # Could switch from floats to int for better accuracy
    }
    return final_data


def write_to_file(final_data):
    # Writes BTC data to a file
    with open('BTC_data.json', 'w') as f:
        json.dump(final_data, f)

# Initialising a simple API app
api = Flask(__name__)

# Defining a route
@api.route('/', methods=['GET'])
def get_rates():
    final_data = main()
    return json.dumps(final_data)


if __name__ == '__main__':
    api.run() 