import time, json, requests
from kafka import KafkaProducer

producer = KafkaProducer(
    bootstrap_servers=['localhost:9092'],
    value_serializer=lambda v: json.dumps(v).encode('utf-8')
)

def stream_data():
    url = "https://api.binance.com/api/v3/ticker/price?symbols=[\"BTCUSDT\",\"ETHUSDT\"]"
    while True:
        data = requests.get(url).json()
        for item in data:
            item['timestamp'] = int(time.time())
            producer.send('crypto_prices', value=item)
            print(f"Sent: {item}")
        time.sleep(5)

if __name__ == "__main__":
    stream_data()