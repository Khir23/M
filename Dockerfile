# Use Ubuntu as the base image
FROM ubuntu:20.04

# Set environment variables to configure timezone and make installation non-interactive
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Riyadh

# Install necessary packages
RUN apt-get update && apt-get install -y \
    tzdata \
    xrdp \
    xfce4 \
    xfce4-terminal \
    dbus-x11 \
    x11-xserver-utils \
    && apt-get clean

# Set default root password
RUN echo "root:P@ssw0rd!" | chpasswd

# Configure XRDP
RUN echo "xfce4-session" >~/.xsession && \
    service xrdp start

# Expose the RDP port
EXPOSE 3389

# Start XRDP service
CMD ["/usr/sbin/xrdp", "--nodaemon"]
