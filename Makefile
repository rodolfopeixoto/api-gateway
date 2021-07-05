generate_document_api:
	bundle exec rails rswag:specs:swaggerize
test:
	bundle exec rspec spec