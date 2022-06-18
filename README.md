# The Peoples Miner Team Presents Alcrymist Lynx
Required: Docker, GIT

Build:
      1 Run: git clone https://github.com/saad-akhtar/tpmt_alcrymist_lynx.git
      2 Run: cd tpmt_alcrymist_lynx
        Following the Configuration section to get needed data from user (i.e. wallet address)
        Edit file named "Dockerfile" in project directory.
        Modify value for variable "TIPSY_ID" (i.e. current: TIPSY_ID=be427dc173b4e890, change to TIPSY_ID=WHAT_EVER_WHAT_WALLET_ID_HASH_FROM_TIPSY_BOT)
      3 Run: docker build --no-cache --tag thepeoplesminerteam/lynx-alcrymist --label thepeoplesminerteam/lynx-alcrymist .
        If using buildx for cross platform then use following command
      4 Run: docker buildx build --no-cache --platform=arm64 --tag thepeoplesminerteam/lynx-alcrymist --label thepeoplesminerteam/lynx-alcrymist .

Steps for User to Create Wallet ID:
    User will be required to visit: https://discord.getlynx.io/ and join the Lynx Blockchain Discord
    Goto the "Getting Started" channel in Lynx Discord and type command
                                                                        !begin (hit enter)
    Next issue one more command to retrieve your wallet address or ID
                                                                        !lynx miner id
    You will a respose looking like so:
                                                                        TipsyLynx ID:  be427dc173b4e890
    along with other statistics. Your TipsyLynx ID will be different than this one above.
    
    
    
    
