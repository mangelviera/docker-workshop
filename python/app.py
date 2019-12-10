from flask import Flask
import os

PORT = os.environ["PORT"]

app = Flask(__name__)

@app.route('/')
def base_route():
    return "Hello world from Python!"


if __name__ == "__main__":
    app.run(port=PORT)