# Cloud


## AWS

### S3
- list files
```bash
s4cmd ls s3://chaordic-dumps/hourly/busca-searchapirequest/2019/05/$day/*/* | cut -d'/' -f10 | sort | uniq | wc -l
```
