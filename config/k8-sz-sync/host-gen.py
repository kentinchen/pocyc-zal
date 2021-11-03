#!/usr/bin/python3

from jinja2 import Environment, FileSystemLoader


def gen_hosts(subdir, area, app, ips):
    env = Environment(loader=FileSystemLoader('.'))
    tpl = env.get_template('host-template.j2')
    with open( area + '-' + app + '-hosts.cfg', 'w+') as fout:
        render_content = tpl.render(Area=area, App=app, ips=ips)
        print(render_content)
        fout.write(render_content)


def get_ip_list(file_name):
    rs = []
    for ln in open(file_name, 'rt'):
        rs.extend(ln.strip().split(' '))
    return rs


if __name__ == '__main__':
    areas = ["sz"]
    for area in areas:
        apps = ["chia"]
        for app in apps:
            ips = get_ip_list("".join([ area, '-', app]))
            gen_hosts("".join([area, '-', app.lower()]), area, app.lower(), ips)
