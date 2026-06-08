# Docker homework

Проект состоит из двух контейнеров:

- `generator` создаёт файл `data/data.csv`;
- `reporter` читает CSV и создаёт `data/report.html`.

Папка `data` с файлами находится на хосте и монтируется в контейнеры как `/data`.

## Запуск

Docker должен быть запущен. Все команды выполняются из корня проекта.

```bash
./run.sh build_generator
./run.sh build_reporter
./run.sh run_generator
./run.sh run_reporter
```

После запуска в папке `data` должны появиться `data.csv` и `report.html`.

## Команды

```text
./run.sh build_generator   - собрать генератор
./run.sh run_generator     - создать data/data.csv
./run.sh create_local_data - создать local_data/data.csv без Docker
./run.sh build_reporter    - собрать аналитик
./run.sh run_reporter      - создать data/report.html
./run.sh structure         - вывести структуру проекта
./run.sh clear_data        - удалить CSV и HTML из data
./run.sh inside_generator  - показать /data из контейнера generator
./run.sh inside_reporter   - показать /data из контейнера reporter
./run.sh report_server     - запустить веб-сервер с отчётом
```

Полная проверка:

```bash
./run.sh clear_data
./run.sh build_generator
./run.sh build_reporter
./run.sh run_generator
./run.sh run_reporter
./run.sh inside_generator
./run.sh inside_reporter
./run.sh report_server
```

Локально отчёт открывается по адресу:

```text
http://localhost:8080/report.html
```

Остановить сервер:

```bash
docker stop hw-report-server
```

## GitHub Codespaces

Nginx работает внутри контейнера на порту `80`. Команда `report_server` пробрасывает его на порт `8080` Codespaces. Затем Codespaces пробрасывает порт в браузер пользователя.

Чтобы открыть отчёт:

1. Запустить команды из раздела «Полная проверка».
2. Открыть вкладку Ports в Codespaces.
3. Найти порт `8080` и нажать Open in Browser.
4. При необходимости добавить `/report.html` в конец адреса.

Пример адреса:

```text
https://<codespace-name>-8080.app.github.dev/report.html
```
