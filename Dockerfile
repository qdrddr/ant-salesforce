FROM frekele/ant:latest
ENV ANT_OPTS=
ENV ANT_LIB_HOME=${ANT_HOME}/lib
ENV ANT_DEV_HOME=/development
ENV Force_com_Migration_Tool=38.0
ENV salesforce_ant_folder=salesforce_ant_${Force_com_Migration_Tool}

RUN wget --no-check-certificate --no-cookies https://gs0.salesforce.com/dwnld/SfdcAnt/${salesforce_ant_folder}.zip \
#	&& wget --no-check-certificate --no-cookies https://gs0.salesforce.com/dwnld/SfdcAnt/${salesforce_ant_folder}.zip.md5 \
#	&& echo "$(cat ${salesforce_ant_folder}.zip.md5) ${salesforce_ant_folder}.zip" | md5sum -c \
#	&& mkdir -p ${ANT_LIB_HOME} \
	&& mkdir -p /${salesforce_ant_folder} \
	&& unzip -a -o ${salesforce_ant_folder}.zip -d /${salesforce_ant_folder} \
	&& ls -la /${salesforce_ant_folder}/ant-salesforce.jar \
#	&& rm -f ${ANT_LIB_HOME}/ant-salesforce.jar \
	&& ln -s /${salesforce_ant_folder}/ant-salesforce.jar ${ANT_LIB_HOME}/ant-salesforce.jar \
#	&& rm -f ${salesforce_ant_folder}.zip.md5 \
	&& rm -f ${salesforce_ant_folder}.zip

# Development folder
RUN mkdir -p $ANT_DEV_HOME

# Mark as volume Development folder for Kitematic GUI
VOLUME $SSL_TRUSTED_CERTS_FOLDER

# change to root folder
WORKDIR /root
