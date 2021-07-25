test:
	export TERM=xterm && bundle exec rspec --format documentation
cov:
	export TERM=xterm && COVERAGE=true bundle exec rspec --format documentation
open:
	export TERM=xterm && COVERAGE=true bundle exec rspec && xdg-open coverage/index.html
lint:
	bundle exec rubocop
jsonlint:
	npx jsonlint-cli data/json/**/*.json
run:
	ruby main.rb
run-debug:
	ruby main.rb --debug
