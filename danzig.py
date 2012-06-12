from flask import Flask, request, session, g, redirect, url_for, abort, \
     render_template
from flask.ext.assets import Environment, Bundle
from scss import parser
import psycopg2
import time

TEMPLATE = 'templates/style.scss'
CSS = 'static/style.css'

app = Flask(__name__)
app.config.from_object(__name__)

assets = Environment(app)
jquery = Bundle('jquery.js', filters='jsmin', output='gen/jquery.js')
assets.register('jquery', jquery)

main = Bundle('main.js', filters='jsmin', output='gen/main.js')
assets.register('main', main)

css = Bundle('style.css', 'ts.css',
            filters='cssmin', output='gen/packed.css')
assets.register('css_all', css)

@app.before_request
def before_request():
    try:
        conn = psycopg2.connect("dbname='danzig' user='jibsix' host='localhost' password='t3stt3st'");
    except:
        print "I am unable to connect to the database"
    cur = conn.cursor()
    g.cur = cur
    getGroups()
    compileCss()


def compileCss():
    """Compile scss file from templates directory"""
    template = app.config['TEMPLATE']
    compiled = open(app.config['CSS'], 'w')
    compiled.write(parser.load(template))

@app.route("/")
def hello():
    return getLayout().strip().replace('\n','')

"""returns the layout skeleton"""
def getLayout():
    return render_template('layout.html')

@app.route("/groups")
def groups():
    time.sleep(4)    
    return getGroups();

def getGroups():
    g.cur.execute("""SELECT teams.name, groups.name from groups LEFT JOIN teams ON teams.fk_group=groups.id""")
    rows = g.cur.fetchall()
    groups = {}
    for row in rows:
        group = row[1]
        team = row[0]
        if not group in groups:
            groups[group] = []
        groups[group].append(team)

    groupWidgets = []
    for group, teams in groups.items():
        groupWidgets.append(render_template('group.part', group=group, teams=teams))

    return ''.join(groupWidgets)

if __name__ == "__main__":
    app.run()
