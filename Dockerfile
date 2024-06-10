#Docker Hubからruby:3.0.5のイメージをプルする
FROM ruby:3.2.4

#debian系のためapt-getを使用してnode.jsとyarnをインストール
RUN apt-get update -qq
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
&& apt-get install -y nodejs
RUN npm install --global yarn

#docker内の作業ディレクトリを作成＆設定
WORKDIR /ror_docker_sample

#Gemfile,Gemfile.lockをローカルからCOPY
COPY Gemfile Gemfile.lock /ror_docker_sample/

#コンテナ内にコピーしたGemfileを用いてbundel install
RUN bundle install

#railsを起動する
CMD ["rails", "server", "-b", "0.0.0.0"]