import json
import time
from datetime import datetime
from flask import Flask, Response, render_template
import requests


application = Flask(__name__)

@application.route('/')
def index():
    return render_template('index.html')


@application.route('/chart-data')
def chart_data():
    def generate_random_data():
        
        while True:
            api_url = "https://min-api.cryptocompare.com/data/price?fsym=XMR&tsyms=USD"
            get_req = requests.get(api_url).text
            response = json.loads(get_req)
            x = response["USD"]

            json_data = json.dumps(
                {'time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'), 'value': x})
            yield f"data:{json_data}\n\n"
            time.sleep(3)

    return Response(generate_random_data(), mimetype='text/event-stream')


if __name__ == '__main__':
    application.run(debug=False, threaded=True, host='0.0.0.0', port=5001)