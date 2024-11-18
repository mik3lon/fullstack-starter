# Combined Makefile for Backend and Frontend Projects

# Variables
BACKEND_DIR := backend
FRONTEND_DIR := frontend

# Colors
YELLOW  = \033[33m
CYAN    = \033[36m
GREEN   = \033[32m
RESET   = \033[0m

# Default target: show help message
.PHONY: help up down logs clean start backend-start frontend-start

help:
	@echo ""
	@echo "Usage: ${CYAN}make [target]${RESET}"
	@echo ""
	@echo "${GREEN}Available targets:${RESET}"
	@echo ""
	@echo "  ${YELLOW}start${RESET}         - Start both backend and frontend servers"
	@echo "  ${YELLOW}up${RESET}            - Start both backend and frontend in detached mode"
	@echo "  ${YELLOW}down${RESET}          - Stop both backend and frontend"
	@echo "  ${YELLOW}logs${RESET}          - View logs for both backend and frontend"
	@echo "  ${YELLOW}clean${RESET}         - Clean up both backend and frontend"
	@echo "  ${YELLOW}backend-start${RESET} - Start the backend server"
	@echo "  ${YELLOW}frontend-start${RESET} - Start the frontend server"
	@echo ""
	@echo "${CYAN}Example: make start${RESET}"
	@echo ""

# Backend-specific commands
backend-up:
	@echo "${CYAN}Starting backend...${RESET}"
	@$(MAKE) -C $(BACKEND_DIR) up

backend-down:
	@echo "${CYAN}Stopping backend...${RESET}"
	@$(MAKE) -C $(BACKEND_DIR) down

backend-logs:
	@echo "${CYAN}Showing backend logs...${RESET}"
	@$(MAKE) -C $(BACKEND_DIR) logs

backend-clean:
	@echo "${CYAN}Cleaning backend...${RESET}"
	@$(MAKE) -C $(BACKEND_DIR) clean

backend-start:
	@echo "${CYAN}Tidying Go modules...${RESET}"
	@cd $(BACKEND_DIR) && go mod tidy
	@echo "${CYAN}Starting backend server...${RESET}"
	@$(MAKE) -C $(BACKEND_DIR) start

frontend-start:
	@echo "${CYAN}Starting frontend server...${RESET}"
	@$(MAKE) -C $(FRONTEND_DIR) start

# Combined commands
up: backend-up
	@echo "${GREEN}Starting backend services...${RESET}"

down: backend-down
	@echo "${GREEN}Stopping backend services${RESET}"

logs: backend-logs
	@echo "${GREEN}Showing logs for backend${RESET}"

clean: backend-clean
	@echo "${GREEN}Cleaned up backend.${RESET}"
