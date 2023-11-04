import logging
import argparse

LOG_FORMAT = "%(asctime)s %(message)s"
logging.basicConfig(level=logging.INFO, format=LOG_FORMAT)

action_choices = ["action1", "action2"]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--action", choices=action_choices, required=True)
    parser.add_argument("--param1", type=str)

    args = parser.parse_args()

    logging.info(args.action)
    logging.info(args.param1)


if __name__ == "__main__":
    main()
