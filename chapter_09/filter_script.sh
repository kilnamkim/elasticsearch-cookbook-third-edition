curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?&pretty=true&size=3' -d '{
  "query": {
    "bool": {
      "filter": {
        "script": {
          "script": {
            "inline": "doc[\"age\"].value > params.param1",
            "params": {
              "param1": 80
            }
          }
        }
      }
    }
  }
}'

curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?&pretty=true&size=3' -d '{
  "query": {
    "script": {
      "script": {
        "inline": "doc[\"age\"].value > param1",
        "lang": "javascript",
        "params": {
          "param1": 80
        }
      }
    }
  }
}'

curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?&pretty=true&size=3' -d '{
    "query": {
        "filtered": {
            "filter": {
                "script": {
                    "script": "doc[\"age\"].value > param1",
                    "lang":"python",
                    "params" : {
                        "param1" : 80
                    }
                }
            },
            "query": {
                "match_all": {}
            }
        }
    }
}'