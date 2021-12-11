FROM ubuntu
RUN apt-get update && \
apt-get install -y --no-install-recommends curl ca-certificates perl && \
apt-get -y clean && \
rm -r /var/lib/apt/lists/* && \
curl -L http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar -zx && \
echo 'selected_scheme scheme-minimal' > texlive.profile && \
install-tl-2*/install-tl -profile texlive.profile && \
rm -r install-tl-2* && \
/usr/local/texlive/202?/bin/*/tlmgr path add && \
tlmgr update --self --all && \
tlmgr install collection-langjapanese
CMD ["/bin/bash"]