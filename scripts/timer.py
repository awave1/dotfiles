import time
import signal
import os

from datetime import datetime, timedelta
from sys import stdout


class GracefulExit:
    exit_now = False

    def __init__(self):
        signal.signal(signal.SIGINT, self.__exit)
        signal.signal(signal.SIGTERM, self.__exit)

    def __exit(self, signal, frame):
        self.exit_now = True


class EventTimer:
    def __init__(self, minutes, app='', hours=0):
        self.minutes = minutes
        self.hours = hours
        self.app = app
        self.__start()

    def __start(self):
        if self.app:
            print('playing music in {}'.format(self.app))
            os.system(
                "osascript -e 'tell app \"{}\" to play'".format(self.app)
            )

    def __end(self):
        if self.app:
            os.system("osascript -e 'tell app \"{}\" to pause'".format(self.app))
        self.__notify('Done!')
        print('done')

    def __notify(self, text):
        if self.app:
            text = self.app + ' - ' + text;

        os.system("osascript -e 'display notification \"{}\" with title \"EventTimer\"'".format(text))

    def start_timer(self):
        start = datetime.now()
        end = start + timedelta(minutes=self.minutes)
        now = datetime.now()
        graceful_exit = GracefulExit()

        while end >= now:
            if graceful_exit.exit_now:
                self.__end()
                break

            time.sleep(0.05)
            now = datetime.now()
            time_left = (end - now)

            stdout.write('\r remaining {}'.format(
                time_left - timedelta(microseconds=time_left.microseconds)
                if time_left > timedelta(0)
                else timedelta(0)
            ))
            stdout.flush()

        print('')
