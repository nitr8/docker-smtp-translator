# SMTP Translator

Pushover is a fantastic service, but email notification via SMTP remains the standard for Unix daemons, Internet of Things, and embedded devices. SMTP Translator bridges the gap by receiving emails via SMTP and converting them into Pushover notifications, providing a simpler and more secure alternative to replicating your Gmail password on all of your systems.

## Running

```bash
docker run -it --rm -p 25:25 -e PUSHOVER_TOKEN=pushover.application.token whumphrey/smtp-translator
```

## Testing

```bash
telnet 127.0.0.1 25
EHLO
MAIL FROM:<some@one.com>
RCPT TO:<pushover.user.key@api.pushover.net> NOTIFY=success,failure
DATA
Subject: Simple Test
<enter>
This is a test message
.
QUIT
```
