#!/usr/bin/env python3

import argparse

from timer import EventTimer


def get_args():
    parser = argparse.ArgumentParser(
        description='Starts music and stops it with a timer'
    )

    parser.add_argument(
        '--app',
        choices=['spotify', 'itunes'],
    )

    parser.add_argument(
        '--mins',
        default=25,
        nargs='?'
    )

    return parser.parse_args()


def main():
    args = get_args()
    mins = float(args.mins)
    app = args.app

    EventTimer(mins, app=app).start_timer()


if __name__ == '__main__':
    main()
