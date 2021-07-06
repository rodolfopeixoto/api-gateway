generate_document_api:
	bundle exec rails rswag:specs:swaggerize
test:
	dotenv -f .env bundle exec rspec spec
server:
	dotenv -f .env bundle exec rails s