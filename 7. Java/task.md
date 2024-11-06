1. Download/install Tomcat server.
2. Verify that it works by visiting the root page.
3. **What ports are used by the java process?**
4. Remove all default applications (including manager), restart Tomcat.
5. Download Jenkins WAR and deploy into Tomcat.
6. Verify that application works (visit application URL).
7. Enable JMX in Tomcat.
8. **What ports are used by the java process?**
9. Change CATALINA_OPTS to use same for RMI as for JMX
10. **What ports are used by the java process?**
11. Rerun tomcat with min heap size 10M and max heap size 20M.
12. **What type of error will you get?**
13. Increase min heap size to 1G and max heap size to 3G, enable parallel garbage collector.
14. Connect by JConsole to Tomcat and look around.
15. Stop Tomcat.
16. Launch Jenkins WAR as a standalone application, verify that it works.

### Answers:

3. 8080, 8005
8. 8080, 8005, and ports declared in CATALINA_OPTS
10. -||-
12. OutOfMemoryError