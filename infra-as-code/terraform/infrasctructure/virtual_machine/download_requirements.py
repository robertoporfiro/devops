import logging
import wget

from retrying import retry


logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s - %(levelname)s: %(message)s',
                    datefmt='%d-%b-%y %H:%M:%S')
# applications
url_data_integration = 'https://requirements.blob.core.windows.net/applications/data_integration.zip'
url_data_gateway_onpremises = 'https://requirements.blob.core.windows.net/applications/data_gateway.exe'

# drivers
url_driver = 'https://requirements.blob.core.windows.net/drivers/drivers_oracle.zip'


@retry(stop_max_attempt_number=5)
def download_application(url: str, name: str):
        try:
            wget.download(url, name)
            return logging.info(f"Download {name} completed.\n\n")
        except Exception as err:
            logging.error(f"Download in {name}\n{err}")
            raise

def main():
    download_application(url_data_integration, 'data_integration.zip')
    download_application(url_data_gateway_onpremises, 'data_gateway.exe')
    download_application(url_driver, 'drivers_oracle.zip')


if __name__ == "__main__":
    main()
