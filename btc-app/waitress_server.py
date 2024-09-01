from waitress import serve
import app
serve(app.api, host='0.0.0.0', port=8080)