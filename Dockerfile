FROM ruby:2.7
RUN gem update --system
RUN apt-get update && apt-get install -y nodejs npm
RUN gem install jekyll bundler
WORKDIR /platoniq.net
VOLUME /platoniq.net
EXPOSE 4000
COPY . .
RUN bundle install
RUN npx netlify-cms-proxy-server & 
CMD ["bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000"]