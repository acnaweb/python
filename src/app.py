import sys

from loguru import logger


def main():
    logger.info("running job")

    # load
    if len(sys.argv) > 0:
        message = sys.argv[1]
        logger.info(message)


if __name__ == "__main__":
    main()
