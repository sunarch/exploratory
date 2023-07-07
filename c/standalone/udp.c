/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>

#define PORT     8080
#define MAXLINE  1024

int main() {
    int sockfd;
    char buffer[MAXLINE];
    char *hello = "Hello from client";
    struct sockaddr_in     servaddr;

    // Creating socket file descriptor
    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sockfd < 0) {
        perror("socket creation failed");
        exit(EXIT_FAILURE);
    }

    int broadcast = 1;
    int sockopt_result =
        setsockopt(sockfd,
                   SOL_SOCKET,
                   SO_BROADCAST,
                   &broadcast,
                   sizeof(broadcast)
    );
    if (sockopt_result < 0) {
        perror("broadcast option could not be enabled");
        exit(EXIT_FAILURE);
    }

    memset(&servaddr, 0, sizeof(servaddr));

    // Filling server information
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(PORT);
    servaddr.sin_addr.s_addr = INADDR_BROADCAST;

    int n, len;

    sendto(sockfd,
           (const char *)hello,
           strlen(hello),
           MSG_CONFIRM,
           (const struct sockaddr *) &servaddr,
           sizeof(servaddr)
    );
    printf("Hello message sent.\n");

/*
    n = recvfrom(sockfd, (char *)buffer, MAXLINE,
                MSG_WAITALL, (struct sockaddr *) &servaddr,
                &len);
    buffer[n] = '\0';
    printf("Server : %s\n", buffer);
*/

    close(sockfd);
    return 0;
}
