FROM febley/counter-strike_server


# Install Metamod And Amx Mod X
COPY addons /hlds/cstrike/addons

RUN grep -v gamedll_linux /hlds/cstrike/liblist.gam > /tmp/liblist.gam \
	&& echo 'gamedll_linux "addons/metamod/dlls/metamod.so"' >> /tmp/liblist.gam \
	&& mv /tmp/liblist.gam /hlds/cstrike/liblist.gam

# Entrypoint to load custom maps
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
