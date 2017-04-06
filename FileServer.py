from flask import Flask
app = Flask(__name__)


@app.route("/program-info")
def hello():
    info_file = open('program-info')
    return info_file.read()

if __name__ == "__main__":
    app.run()
