import argparse
import subprocess
import os

FILES = {
    'vimrc': '~/.config/nvim/init.vim',
    'bashrc': '~/dotfiles/bashrc',
}

def save_files():
    print(f"Starting file saving")
    for file_name, file_path in FILES.items():
        print(f"Copying {file_path}...")
        subprocess.call(['cp', os.path.expanduser(file_path), file_name])
    print(f"Done")

if __name__ == '__main__':
    subprocess.call(['ls', '~'])
    parser = argparse.ArgumentParser()
    parser.add_argument('--save', help='save the config files', action='store_true')
    parser.add_argument('--update', help='download files from git', action='store_true')
    args = parser.parse_args()

    if args.save:
        save_files()
