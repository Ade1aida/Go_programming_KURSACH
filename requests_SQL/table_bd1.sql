CREATE TABLE Projects (
	id serial PRIMARY KEY,
	title TEXT
);

CREATE TABLE Author (
	id serial PRIMARY KEY,
	name TEXT
);

CREATE TABLE Issue (
    id serial PRIMARY KEY,
    project_ID INT NOT NULL,
    FOREIGN KEY (project_ID) REFERENCES Projects (id) ON DELETE CASCADE ON UPDATE CASCADE,
    author_ID INT NOT NULL,
    FOREIGN KEY (author_ID) REFERENCES Author (id) ON DELETE CASCADE ON UPDATE CASCADE,
    assignee_ID INT NOT NULL,
    key TEXT,
    summary TEXT,
    description TEXT,
    type TEXT,
    priority TEXT,
    status TEXT,
    createdTime TIMESTAMP WITHOUT TIME ZONE,
    closedTime TIMESTAMP WITHOUT TIME ZONE,
    updatedTime TIMESTAMP WITHOUT TIME ZONE,
    timeSpent INT
);

CREATE TABLE StatusChanges (
    issue_ID INT NOT NULL,
    FOREIGN KEY (issue_ID) REFERENCES Issue (id) ON DELETE CASCADE ON UPDATE CASCADE,
    author_ID INT NOT NULL,
    FOREIGN KEY (author_ID) REFERENCES Author (id) ON DELETE CASCADE ON UPDATE CASCADE,
    changeTime TIMESTAMP WITHOUT TIME ZONE,
    fromStatus TEXT,
    toStatus TEXT
);