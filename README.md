# caddy-homeserver
Worked example for a Caddy docker homeserver (with google cloud DNS) using Portainer for management.

Installation steps:

1. Set up two wildcard domains in Google Cloud DNS to use with this project.  The main domain should
   point at your external IP, while the local domain should point at your server's internal network IP.
2. Run `docker-compose -f docker-compose.portainer.yml up -d`.  This will bring Portainer 
   up on port 9000.  Next, visit `http://<ip_of_machine_docker_is_running_on>:9000` in your browser.
3. Set the initial admin password for Portainer, then click `Primary->Stacks->Add Stack` to start
   creating your Caddy stack.  Name it "caddy" and paste the contents of `docker-compose.caddy.yml`
   into it.
4. Set the environment variables in the `environment` section near the top.
5. Click "Deploy the stack" to start Caddy.
6. See if you can access Portainer through Caddy via https://portainer.$LOCAL_DOMAIN (from the env
   vars you filled out in step 4).
7. If it works, try adding another stack using the template found in `docker-compose.example-service.yml`.
