# Printout with timestamp
function log {
  timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  echo "$timestamp: $1"
}

  log "Converting airflow.properties to airflow.cfg ..."
  local DIR=$1
