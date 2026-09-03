from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def hello():
    return render_template('index.html')

if __name__ == '__main__':
    # 0.0.0.0 so the container's exposed port is reachable from the EC2 host / internet,
    # not just from inside the container.
    app.run(host='0.0.0.0', port=5000)
