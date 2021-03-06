# Conceal-core build

FROM ubuntu:bionic AS build

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y build-essential python-dev gcc g++ git cmake libboost-all-dev

WORKDIR /conceal-core

COPY ./conceal-core .

WORKDIR /conceal-core/build

RUN cmake ..

RUN make

# Conceal-node installation

FROM ubuntu:bionic

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y python-dev libboost-all-dev

WORKDIR /opt/conceal-core

COPY --from=build /conceal-core/build/src ./

WORKDIR /opt/conceal-guardian

COPY ./conceal-guardian/package.json ./

RUN apt-get install -y npm

RUN npm install

RUN npm install pm2 -g

COPY ./conceal-guardian/ .

EXPOSE 16000

CMD ["pm2-runtime","index.js"]

