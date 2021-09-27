GITHUB=https://github.com/umich-stivenr

default: build businessdb

.PHONY: build, businessdb, clean, start

build:
	git clone $(GITHUB)/dbserver.git
	git clone $(GITHUB)/dbui.git
	git submodule init && git submodule update
	cd dbserver && npm install
	cd dbui && npm install

businessdb:
	mysql -u $(SQLUSER) --password=$(SQLPWD) --database=business < sql/setup.sql

clean:
	rm -rf {dbserver,dbui}
	mysql -u $(SQLUSER) --password=$(SQLPWD) --database=business < sql/teardown.sql

start:
	cd dbserver && node server.js >> dbserver.log & echo $$! >> dbserver.pid
	cd dbui && expo start >> dbui.log & echo $$! >> dbui.pid

stop:
	cat dbserver.pid | xargs pgrep -P | xargs kill
	cat dbui.pid | xargs pgrep -P | xargs kill
	rm *.pid
