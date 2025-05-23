Original post is [here](https://www.reddit.com/r/Bitwarden/comments/a67c1n/comment/ebunt81/)
1. Install this tool [SteamDesktopAuthenticator ver 1.0.14](https://github.com/Jessecar96/SteamDesktopAuthenticator/releases/tag/1.0.14). Note: use only from this repo!
2. Link your phone number to your Steam account if you haven’t done so already.
3. Setup 2FA using SteamDesktopAuthenticator for your Steam account.
4. Extract OTP seed from [your_steamID].maFile inside `maFiles`-subdirectory where the SDA is installed. Seed is value of `secret` parameter from JSON variables which looks like: `"uri":"otpauth://totp/Steam:your-username?secret=ABCDEFGHIJKLMN1234OPQRSTUVWXYZ4321&issuer=Steam"`
5. Add new OTP for entry using OTP seed, choose Steam settings.
6. Check that the OTP code from KeePassXC matches the one from Steam Desktop Authenticator.
