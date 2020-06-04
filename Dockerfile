FROM node:13-alpine

EXPOSE 22
ENTRYPOINT ["/bin/entrypoint"]

COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint.sh /bin/entrypoint

RUN apk add --update --no-cache openssh tmux curl bash jq coreutils neovim git zsh fontconfig
RUN apk add terminus-font
RUN npm install -g yarn
RUN ssh-keygen -A
RUN adduser -D -s /bin/zsh pair
RUN echo "pair:test123456" | chpasswd
RUN mkdir /home/pair/.ssh && touch /home/pair/.ssh/authorized_keys
RUN chown -R pair:pair /home/pair
