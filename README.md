# Photogigs Backend API

A Rails 7.1 API for managing photographers and reviews, built with PostgreSQL.

## Prerequisites

Before you begin, ensure you have the following installed on your Mac:

- **Homebrew** - Package manager for macOS
- **Ruby 3.2.2** - Programming language
- **rbenv** - Ruby version manager
- **PostgreSQL** - Database
- **Bundler** - Ruby gem manager

## Initial Setup

### 1. Install Homebrew (if not already installed)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to your PATH
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
source ~/.zprofile
```

### 2. Install rbenv and Ruby

```bash
# Install rbenv and ruby-build
brew install rbenv ruby-build

# Add rbenv to your shell
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zprofile
echo 'eval "$(rbenv init -)"' >> ~/.zprofile
source ~/.zprofile

# Install Ruby 3.2.2
rbenv install 3.2.2
rbenv global 3.2.2

# Verify installation
ruby -v  # Should show ruby 3.2.2
```

### 3. Install PostgreSQL

```bash
# Install PostgreSQL
brew install postgresql@14

# Start PostgreSQL service
brew services start postgresql@14

# Verify it's running
brew services list | grep postgres
```

## Project Setup

### 1. Clone the Repository

```bash
git clone https://github.com/claudiahalip/claudiahalip-Photogigs-backend-db-postgresql.git
cd claudiahalip-Photogigs-backend-db-postgresql
```

### 2. Set Ruby Version

```bash
# Set local Ruby version for this project
rbenv local 3.2.2
```

### 3. Install Dependencies

```bash
# Install bundler
gem install bundler

# Install all gems
bundle install
```

### 4. Database Setup

```bash
# Create the database
bundle exec rails db:create

# Run migrations to create tables
bundle exec rails db:migrate

# Seed the database with sample data
bundle exec rails db:seed
```

### 5. Start the Server

```bash
# Start the Rails server
bundle exec rails server

# Server will run on http://localhost:3001
```

## API Endpoints

### Photographers

- `GET /photographers` - List all photographers
- `GET /photographers/:id` - Get a specific photographer
- `POST /photographers` - Create a new photographer
- `PATCH /photographers/:id` - Update a photographer

### Reviews

- `GET /reviews` - List all reviews
- `GET /reviews/:id` - Get a specific review
- `POST /reviews` - Create a new review

### Users

- `GET /users` - List all users
- `GET /users/:id` - Get a specific user
- `POST /users` - Register a new user

### Sessions (Authentication)

- `POST /sessions` - Login
- `GET /is_logged_in` - Check login status
- `DELETE /sessions` - Logout

## Testing the API

### Using Browser

Simply open these URLs in your browser:
- http://localhost:3001/photographers
- http://localhost:3001/reviews

### Using curl

```bash
# Get all photographers
curl http://localhost:3001/photographers

# Get a specific photographer
curl http://localhost:3001/photographers/1

# Create a photographer
curl -X POST http://localhost:3001/photographers \
  -H "Content-Type: application/json" \
  -d '{
    "photographer": {
      "name": "John Doe",
      "website": "https://johndoe.com",
      "years_of_experience": "5",
      "city": "New York",
      "state": "NY",
      "image": "https://example.com/image.jpg"
    }
  }'

# Create a review
curl -X POST http://localhost:3001/reviews \
  -H "Content-Type: application/json" \
  -d '{
    "review": {
      "content": "Excellent work!",
      "photographer_id": 1
    }
  }'
```

## Rails Console

Access the Rails console to interact with your database:

```bash
# Start console (without Spring)
bundle exec rails console --no-spring

# Example commands in console:
Photographer.count
Review.all
Photographer.first
```

## Troubleshooting

### PostgreSQL Connection Issues

If you get connection errors:

```bash
# Check if PostgreSQL is running
brew services list | grep postgres

# Restart PostgreSQL
brew services restart postgresql@14
```

### Ruby Version Issues

```bash
# Verify Ruby version
ruby -v

# If wrong version, set it again
rbenv local 3.2.2
rbenv rehash
```

### Bundle Install Errors

```bash
# Clean and reinstall
rm -f Gemfile.lock
rm -rf .bundle/
bundle install
```

### Database Reset

If you need to reset your database:

```bash
# Drop, create, migrate, and seed
bundle exec rails db:reset
```

## Technology Stack

- **Ruby**: 3.2.2
- **Rails**: 7.1.5
- **Database**: PostgreSQL
- **Server**: Puma
- **Authentication**: bcrypt (password hashing)

## Development Notes

- Server runs on port 3001 by default
- API uses JSON format for requests and responses
- CORS is enabled via rack-cors gem
- Active Storage is configured for image uploads

## Future Improvements

When refactoring the frontend to Next.js:
- Consider switching to JWT token-based authentication
- Update API to use proper HTTP status codes consistently
- Add API versioning (e.g., `/api/v1/photographers`)
- Implement pagination for list endpoints
- Add API documentation (Swagger/OpenAPI)

## License

This project is private and proprietary.