FROM runatlantis/atlantis

RUN \
    # Get dependencies
    apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    git \
    grep \
    jq \
    make \
    openssh-client \
    sudo \
    wget

RUN echo 'Installing Terragrunt' && \
    wget -O /usr/local/bin/terragrunt \
    $(curl -s https://api.github.com/repos/gruntwork-io/terragrunt/releases/latest | \
    jq -r '.assets|.[]|select(.name=="terragrunt_linux_amd64")|.browser_download_url') && \
    chmod +x /usr/local/bin/terragrunt