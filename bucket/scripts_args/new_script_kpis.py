# Script to create kpis
import os, json

kpis = {
    "new_purchases": {
        "name": "new_purchases: Number of Orders that used Search",
        "tag": "new_purchases",
        "breakdown": "day,week,month,client,devicetype,pagetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "new_overall_purchases": {
        "name": "new_overall_purchases: Numbers of Orders of the site",
        "tag": "new_overall_purchases",
        "breakdown": "day,week,month,client,devicetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "new_sales": {
        "name": "new_sales: Revenue of Product that were clicked and buyed from Search",
        "tag": "new_sales",
        "breakdown": "day,week,month,client,devicetype,pagetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "new_overall_sales": {
        "name": "new_overall_sales: Revenue of the site",
        "tag": "new_overall_sales",
        "breakdown": "day,week,month,client,devicetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "new_sessions": {
        "name": "new_sessions: Number of sessions that used Search",
        "tag": "new_sessions",
        "breakdown": "day,week,month,client,devicetype,pagetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "new_overall_sessions": {
        "name": "new_overall_sessions: Number of Sessions of the site",
        "tag": "new_overall_sessions",
        "breakdown": "day,week,month,client,devicetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "new_pageviews": {
        "name": "new_pageviews: Number of pageviews of Search",
        "tag": "new_pageviews",
        "breakdown": "day,week,month,client,devicetype,pagetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "new_overall_pageviews": {
        "name": "new_overall_pageviews: Number of pageviews of the site",
        "tag": "new_overall_pageviews",
        "breakdown": "day,week,month,client,devicetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "new_clicks": {
        "name": "new_clicks: Number of clicks on products from Search",
        "tag": "new_clicks",
        "breakdown": "day,week,month,client,devicetype,pagetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "new_overall_clicks": {
        "name": "new_overall_clicks: Number of pageviews of product page",
        "tag": "new_overall_clicks",
        "breakdown": "day,week,month,client,devicetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "new_searches_with_clicks": {
        "name": "new_searches_with_clicks: Number of searches with at least one click",
        "tag": "new_searches_with_clicks",
        "breakdown": "day,week,month,client,devicetype,pagetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "new_sessions_with_clicks": {
        "name": "new_sessions_with_clicks: Number of search sessions with at least one click",
        "tag": "new_sessions_with_clicks",
        "breakdown": "day,week,month,client,devicetype,pagetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "new_sessions_with_purchase": {
        "name": "new_sessions_with_purchase: Number of search sessions with some order",
        "tag": "new_sessions_with_purchase",
        "breakdown": "day,week,month,client,devicetype,pagetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "new_overall_sessions_with_purchases": {
        "name": "new_overall_sessions_with_purchases: Number of entire-site sessions with some order",
        "tag": "new_overall_sessions_with_purchases",
        "breakdown": "day,week,month,client,devicetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "new_unique_searches_per_session": {
        "name": "new_unique_searches_per_session: Number of distinct searches within a session. If a same query is done twice within a session, it is counted just once",
        "tag": "new_unique_searches_per_session",
        "breakdown": "day,week,month,client,devicetype,pagetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "new_requests": {
        "name": "new_requests: Number of requests directly to servers, Search Pages and Search API",
        "tag": "new_requests",
        "breakdown": "day,week,month,client,pagetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
}

# url = "https://dashboard-api.linximpulse.net/v2/config/kpi/search";
url = "http://localhost:8200/v2/config/kpi/search";

for tag, bodyJson in kpis.items():
    command =  "curl -X POST " + url + "" \
                " -H 'Authorization: Basic ZXRsX25lZW11OjBSUDl1ZUhxRXd1QUwyRHVqNkFwd203ZnYzendBWg=='" \
                " -H 'Cache-Control: no-cache'" \
                " -d '" + json.dumps(bodyJson) + "'"
    print "\n"+ command + "\n"
    os.system(command)
