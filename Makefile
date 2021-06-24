test:
	export TERM=xterm && bundle exec rspec
cov:
	export TERM=xterm && COVERAGE=true bundle exec rspec
open:
	export TERM=xterm && COVERAGE=true bundle exec rspec && xdg-open coverage/index.html
lint:
	bundle exec rubocop
run:
	ruby main.rb
test-run:
	ruby main.rb --test-run
