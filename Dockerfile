FROM python:3.10-slim

# set the working directory
WORKDIR /code

# install dependencies
COPY ./requirements.txt ./
RUN pip install --no-cache-dir --upgrade -r requirements.txt && apt update && apt install nano
#install vscode extensions
RUN echo "code --install-extension ms-python.python --install-extension devonray.snippet --install-extension twxs.cmake" >> ~/.bashrc
# copy the src to the folder
COPY ./src ./src
#COPY vscode-extensions.txt /code/
# start the server
CMD ["uvicorn", "src.main:app", "--reload"]
