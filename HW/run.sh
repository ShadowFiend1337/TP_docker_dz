case "$1" in
  build_generator)
    docker build -t hw-generator ./generator
    ;;
  run_generator)
    docker run --rm -v "$(pwd)/data:/data" hw-generator
    ;;
  create_local_data)
    python3 ./generator/generate.py ./local_data
    ;;
  build_reporter)
    docker build -t hw-reporter ./reporter
    ;;
  run_reporter)
    docker run --rm -v "$(pwd)/data:/data" hw-reporter
    ;;
  structure)
    find .
    ;;
  clear_data)
    rm -f data/*.csv data/*.html
    ;;
  inside_generator)
    docker run --rm -v "$(pwd)/data:/data" hw-generator ls -la /data
    ;;
  inside_reporter)
    docker run --rm -v "$(pwd)/data:/data" hw-reporter ls -la /data
    ;;
  report_server)
    docker run --rm -d --name hw-report-server -p 8080:80 -v "$(pwd)/data:/usr/share/nginx/html:ro" nginx:alpine
    ;;
  *)
    echo "Неизвестная команда"
    ;;
esac
