# Script to create kpis
import os, json

kpis = {
    "overall_sales": {
        "name": "site sales",
        "tag": "overall_sales",
        "breakdown": "day,week,month,client,devicetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "sales": {
        "name": "search sales",
        "tag": "sales",
        "breakdown": "day,week,month,client,devicetype,pagetype",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "sessions_overall": {
        "name": "whole site sessions",
        "tag": "sessions_overall",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "overall_sessions_with_purchase": {
        "breakdown": "day,week,month,client",
        "name": "Site sessions with purchase",
        "tag": "overall_sessions_with_purchase",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "sessions": {
        "name": "sessions with search",
        "tag": "sessions",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "sessions_with_clicks": {
        "name": "search sessions with clicks",
        "tag": "sessions_with_clicks",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "sessions_with_purchase": {
        "name": "search sessions with purchase",
        "tag": "sessions_with_purchase",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "sessions_with_autocomplete": {
        "name": "sessions with autocomplete",
        "tag": "sessions_with_autocomplete",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "searches_with_clicks": {
        "name": "searches with clicks",
        "tag": "searches_with_clicks",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "distinct_queries": {
        "name": "distinct queries (cockpit searches)",
        "tag": "distinct_queries",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "approximated_searches": {
        "name": "approximated searches",
        "tag": "approximated_searches",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "notfound_searches": {
        "name": "not found searches",
        "tag": "notfound_searches",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "clicks_from_quickfilter": {
        "name": "clicks from quickfilter",
        "tag": "clicks_from_quickfilter",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "search_requests": {
        "name": "requests to search server",
        "tag": "search_requests",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "average_minutes_overall": {
        "name": "average minutes overall",
        "tag": "average_minutes_overall",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "pagination_pageviews": {
        "name": "pagination pageviews",
        "tag": "pagination_pageviews",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "filter_pageviews": {
        "name": "filter pageviews",
        "tag": "filter_pageviews",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "reorder_pageviews": {
        "name": "reorder pageviews",
        "tag": "reorder_pageviews",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "simple_pageviews": {
        "name": "simple pageviews",
        "tag": "simple_pageviews",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "quickfilter_pageviews": {
        "name": "quickfilter pageviews",
        "tag": "quickfilter_pageviews",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "navigation_pageviews": {
        "name": "navigation pageviews",
        "tag": "navigation_pageviews",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "hotsite_pageviews": {
        "name": "hotsite pageviews",
        "tag": "hotsite_pageviews",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "pages_pageviews": {
        "name": "pages pageviews",
        "tag": "pages_pageviews",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "mobile_pageviews": {
        "name": "mobile pageviews",
        "tag": "mobile_pageviews",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "pageviews": {
        "name": "search pageviews",
        "tag": "pageviews",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "products_clicks_map": {
        "name": "products clicks map",
        "tag": "products_clicks_map",
        "breakdown": "day,week,month,client,category",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "pages_sessions": {
        "name": "Pages sessions",
        "tag": "pages_sessions",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    },
    "pages_purchases": {
        "name": "Pages purchases",
        "tag": "pages_purchases",
        "breakdown": "day,week,month,client",
        "params": "",
        "sample": False,
        "mode": "number",
        "is_mean": False,
        "type": "dailyfact",
        "fn": None
    }
}

url = "https://dashboard-api.chaordicsystems.com/v2/config/kpi/search";
#url = "http://localhost:8200/v2/config/kpi/search";

for tag, bodyJson in kpis.items():
    command =  "curl -X POST " + url + "" \
                " -H 'Authorization: Basic ZXRsX25lZW11OjBSUDl1ZUhxRXd1QUwyRHVqNkFwd203ZnYzendBWg=='" \
                " -H 'Cache-Control: no-cache'" \
                " -d '" + json.dumps(bodyJson) + "'"
    print "\n"+ command + "\n"
    os.system(command)
