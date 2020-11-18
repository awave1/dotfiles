#!/usr/bin/env python3

import argparse
import time
import signal
import os

from datetime import datetime, timedelta
from sys import stdout


class GracefulExit:
    exit_now = False

    def __init__(self):
        signal.signal(signal.SIGINT, self.exit)
        signal.signal(signal.SIGTERM, self.exit)

    def exit(self, signal, frame):
        self.exit_now = True


class EventTimer:
    def __init__(self, minutes, app='', hours=0):
        self.minutes = minutes
        self.hours = hours
        self.app = app
        self.start()

    def start(self):
        if not self.app:
            self.app = 'spotify'

        print(f'playing music in {self.app}')

        os.system(
            f"osascript -e 'tell app \"{self.app}\" to play'"
        )

    def end(self):
        if self.app:
            os.system(f"osascript -e 'tell app \"{self.app}\" to pause'")
        self.notify('Done!')
        print('done')

    def notify(self, text):
        if self.app:
            text = self.app + ' - ' + text

        os.system(
            f"osascript -e 'display notification \"{text}\" with title \"EventTimer\"'"
        )

    def start_timer(self):
        start = datetime.now()
        end = start + timedelta(minutes=self.minutes)
        now = datetime.now()
        graceful_exit = GracefulExit()

        while end >= now:
            if graceful_exit.exit_now:
                self.end()
                break

            time.sleep(0.05)
            now = datetime.now()
            time_left = (end - now)

            print('\r remaining {}'.format(
                time_left - timedelta(microseconds=time_left.microseconds)
                if time_left > timedelta(0)
                else timedelta(0)
            ))

        print('')


def get_args():
    parser = argparse.ArgumentParser(
        description='Starts music and stops it with a timer'
    )

    parser.add_argument(
        '--app',
        choices=['spotify'],
        default='spotify'
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
