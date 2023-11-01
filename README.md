# Jupyter Notebook: Interest Rates vs Inflation (CPI)

I assume that the user is familiar in Python and in how to load Jupyter.

If using a virtual environment, such as venv or conda, you can use the requirements.txt file to load relevant Python modules.

## .env

There is a .env_empty file. If you wish to replicate saving of the plots to Plotly so that they can be hosted on there, then you will need to obtain an API key from them. I used a free one.

## Docker

For those familiar with Docker, there is a Dockerfile and compose file that can be run via 'docker compose up'
It's a big Dockerfile but I always find slim python docker images absolutely useless as soon as I want to install ever so slightly rogue.

# Datasets

For convenience, I have uploaded the BIS reference table in the bis_data folder. However, other supplementary dataests, such as the inflation (CPI) and central policy rate data were too big to upload if wanting to look at all countries. Therefore, I have provided the source links inline within the Jupyter notebook where you can select and download yourself.
