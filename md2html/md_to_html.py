from flask import Flask, render_template
import markdown
from markdown.extensions.codehilite import CodeHiliteExtension

app = Flask(__name__)

@app.route('/')
def index():
    with open('python_tutorial.md', 'r', encoding='utf-8') as file:
        markdown_text = file.read()
        html = convert_to_html(markdown_text)
    return render_template('index.html', html=html)

def convert_to_html(markdown_text):
    extensions = ['codehilite']
    html = markdown.markdown(markdown_text, extensions=extensions)
    return html

if __name__ == '__main__':
    app.run(debug=True)
