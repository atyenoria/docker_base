FROM ubuntu

MAINTAINER atyenoria

#basic
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y curl lsof htop wget build-essential software-properties-common git vim

# Set Environment Variables & Language Environment
ENV HOME /root

#Update Base System
RUN apt-get update && apt-get -y upgrade \
      && apt-get install -y language-pack-en \
      && locale-gen en_US.UTF-8 \
      && dpkg-reconfigure locales


# Install Zsh
RUN apt-get install -y zsh
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
      && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
      && chsh -s /bin/zsh

ADD  ./.zshrc /root/.zshrc

# Install peco & put peco script
RUN cd /opt \
      && wget https://github.com/peco/peco/releases/download/v0.1.12/peco_linux_amd64.tar.gz \
      && tar xvf peco_linux_amd64.tar.gz \
      && ln -s /opt/peco_linux_amd64/peco /usr/local/bin \
      && mkdir -p ~/.zsh \
      && git clone https://gist.github.com/2c9151f2274ccad8bffc.git ~/.zsh/ \
      && echo "source ~/.zsh/peco-select-history.zsh" >> ~/.zshrc

# Install jq
RUN cd /opt \
      && mkdir jq \
      && wget -O ./jq/jq http://stedolan.github.io/jq/download/linux64/jq \
      && chmod +x ./jq/jq \
      && ln -s /opt/jq/jq /usr/local/bin


#vim plugin
RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
RUN git clone https://github.com/atyenoria/vim-pathogen.git ~/.vim.tmp
RUN ln -sf ~/.vim.tmp/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim
RUN git clone https://github.com/atyenoria/nerdcommenter.git ~/.vim/bundle/nerdcommenter
RUN git clone https://github.com/atyenoria/delimitMate.git ~/.vim/bundle/delimitMate
RUN git clone https://github.com/atyenoria/PDV--phpDocumentor-for-Vim.git ~/.vim/bundle/phpDocumentor
RUN git clone https://github.com/atyenoria/vim-colorschemes.git ~/.vim/bundle/colorschemes
RUN git clone https://github.com/atyenoria/vim-misc.git ~/.vim/bundle/vim-misc
RUN git clone https://github.com/atyenoria/vim-colorscheme-switcher.git ~/.vim/bundle/colorscheme-switcher
ADD .vimrc /root/.vimrc


#locate
RUN apt-get install -y mlocate && updatedb





