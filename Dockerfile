FROM python:3.11

# Install Django and dependencies
RUN pip install django==3.2
# Fix for ModuleNotFoundError: No module named 'distutils' in newer Python versions (3.12+).
# setuptools provides the necessary functionality.
RUN pip install setuptools

COPY . .

# Run database migrations
RUN python manage.py migrate

EXPOSE 8000
CMD ["python","manage.py","runserver","0.0.0.0:8000"]