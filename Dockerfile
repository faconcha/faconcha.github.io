# Use the official Ruby image as a parent image
FROM ruby:3.0

# Set the working directory in the container
WORKDIR /usr/src/app

# Install Node.js and npm
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

# Install Jekyll and Bundler
RUN gem install jekyll bundler

# Install gulp-cli globally
RUN npm install --global gulp-cli

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed packages specified in Gemfile
RUN bundle install

# Make port 4000 available to the world outside this container
EXPOSE 4000

# Define environment variable
ENV NAME World

# Run Jekyll when the container launches
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
