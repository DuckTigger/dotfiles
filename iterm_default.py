import iterm2
import sys

async def main(connection, mode):
    all_profiles = await iterm2.PartialProfile.async_query(connection)
    for profile in all_profiles:
        print(profile)
        if profile.name == mode:
            await profile.async_make_default()
    return

if __name__ == "__main__":
    mode = sys.argv[1]
    iterm2.run_until_complete(main, mode)

