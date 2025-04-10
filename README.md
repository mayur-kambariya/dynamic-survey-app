# Project Setup and Running Instructions

## Prerequisites

- **Ruby Version**: Ensure you have the correct Ruby version installed. You can check the required version in the `.ruby-version` file or by using a version manager like `rbenv` or `rvm`.
- **Bundler**: Make sure you have Bundler installed. You can install it with:
  ```bash
  gem install bundler
  ```

## Setup

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Install Dependencies**:
   ```bash
   bundle install
   ```

3. **Set Up the Database**:
   Ensure PostgreSQL is installed and running. Then, run:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Install JavaScript Dependencies**:
   If using `jsbundling-rails`, ensure Node.js is installed, then run:
   ```bash
   yarn install
   ```

## Running the Application

- **Start the Server**:
  Use the following command to start the application:
  ```bash
  bin/dev
  ```

## Running Tests

- **Run RSpec Tests**:
  Execute the test suite with:
  ```bash
  bundle exec rspec
  ```

## Additional Tools

- **Brakeman**: For static analysis of security vulnerabilities, run:
  ```bash
  bundle exec brakeman
  ```

- **Rubocop**: For code style checks, run:
  ```bash
  bundle exec rubocop
  ```

## Notes

- **React-Rails**: If using React components, ensure the `react-rails` gem is properly set up.
- **Hotwire**: The application uses Hotwire for SPA-like features. Ensure `turbo-rails` and `stimulus-rails` are configured if needed.
