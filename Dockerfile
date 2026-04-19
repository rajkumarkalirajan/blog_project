FROM python:3.10

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

# IMPORTANT: point Python to project root
ENV PYTHONPATH=/app

EXPOSE 8000

CMD ["gunicorn", "blog_project.wsgi:application", "--bind", "0.0.0.0:8000"]
